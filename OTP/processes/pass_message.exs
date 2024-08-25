defmodule PassMessage do
  def message do
    receive do
      sender -> IO.puts("Hi, #{sender}")
    end
  end

  def message_back do
    receive do
      {pid, sender} -> send(pid, "Hi, #{sender}")
    end

    # Wait recursively
    # message_back()
  end
end
