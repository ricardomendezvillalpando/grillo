class MetricsController < ApplicationController
  def create
    key = params[:key]
    value = params[:value].to_i

    metric = Metric.create(key: key, value: value)
    render json: {}, status: :ok
  end

  def destroy
    key = params[:key]

    Metric.where(key: key).destroy_all
    render json: {}, status: :ok
  end

  def index
    metrics = Metric.where(created_at: 1.hour.ago..Time.now)
                   .group(:key)
                   .select('key, SUM(value) AS total')
                   .map { |m| { name: m.key, total: m.total } }

    render json: metrics, status: :ok
  end
end
