defmodule LiveViewPlaygroundWeb.LightLiveTemporaryAssigns do
  use LiveViewPlaygroundWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      assign(socket, :messages, [
        %{id: Integer.to_string(System.unique_integer()), msg: "initial msg"}
      ])

    {:ok, socket, temporary_assigns: [messages: []]}
  end

  def handle_event("new", params, socket) do
    socket =
      assign(socket, :messages, [
        %{id: Integer.to_string(System.unique_integer()), msg: params["msg"]}
      ])

    {:noreply, socket}
  end
end
