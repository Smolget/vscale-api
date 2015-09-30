module Vscale
  module Tickets
    def tickets
      get('tickets')
    end

    def tickets_new(params)
      post('tickets', params)
    end

    def ticket_comments
      get("tickets/#{id}/comments")
    end

    def tickets_add_comment(params)
      post('tickets', params)
    end

    def tickets_close(id)
      post("tickets/#{id}/close")
    end
  end
end
