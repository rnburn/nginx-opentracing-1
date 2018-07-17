const opentracing = require('opentracing');
const winston = require('winston');

const lightstep = require('lightstep-tracer');

exports.makeJaegerTracer = function(options) {
};

exports.makeLightstepTracer = function(options) {
  if (typeof options.access_token === 'undefined') {
    winston.error('no access_token given!');
    process.exit(1);
  }
  return new lightstep.Tracer(
      { access_token: options.access_token, component_name: 'zoo' });
};
