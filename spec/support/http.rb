module HttpHelpers
  def make_get_request(path)
    try_catch { RestClient.get "#{bits_service_endpoint}#{path}" }
  end

  def make_put_request(path, body)
    try_catch { RestClient.put "#{bits_service_endpoint}#{path}", body }
  end

  private

  def try_catch
    begin
      yield
    rescue Exception => e
      e.response
    end
  end
end