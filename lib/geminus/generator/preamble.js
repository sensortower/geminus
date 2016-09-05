var TYPE_PROPERTY = 0,
    TYPE_VALUE    = 1,
    TYPE_FUNCTION = 2;

function Geminus(namespace, object) {

}

definitions = []

// TYPE:0
definitions.push(function (host, name, arr) {
});

// TYPE:1
definitions.push(function (host, name, value) {
  Object.defineProperty(host, name, { value: value });
});

// TYPE:2
definitions.push(function (host, name, value) {
  host[name] = function () { return value };
});

function Property(object) {
}

geminus("Platform", [
  [0, "itunes", [
    [1, "os", "ios"],
    [2, "isAndroid", false]
  ]]
]);

function geminus(src, dst) {
  var key, val;

  dst = dst || world;

  for (key in src) {
    if (!src.hasOwnProperty(key)) {
      continue;
    }

    val = src[key];

    if (typeof val === "object") {
      val = geminus(val, dst[key] || {});
    }

    Object.defineProperty(dst, key, {
      configurable: true, // set to false once geminus() will not be redefining props
      enumerable:   true,
      writable:     false,
      value:        val
    });
  }

  return dst;
}
