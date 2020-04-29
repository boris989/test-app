# frozen_string_literal: true

if Rails.env.production?
  require 'prometheus_exporter/middleware'

  # This reports stats per request like HTTP status and timings
  Rails.application.middleware.unshift PrometheusExporter::Middleware

  require 'prometheus_exporter/instrumentation'
  # this reports basic process stats like RSS and GC info
  PrometheusExporter::Instrumentation::Process.start(type: 'web')
end
