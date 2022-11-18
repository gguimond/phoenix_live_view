defmodule LiveViewPlaygroundWeb.LightLive do
  use LiveViewPlaygroundWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :brightness, 10)}
  end

  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    socket = update(socket, :brightness, &max(&1 - 10, 0))
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    socket = update(socket, :brightness, &min(&1 + 10, 100))
    {:noreply, socket}
  end

  def handle_event("half", params, socket) do
    IO.inspect(params)
    socket = assign(socket, :brightness, params["brightness"])

    {:noreply,
     push_patch(socket,
       to: Routes.live_path(socket, LiveViewPlaygroundWeb.LightLive, params)
     )}
  end

  def handle_params(params, _uri, socket) do
    socket = assign(socket, :brightness, 50)
    {:noreply, socket}
  end
end
