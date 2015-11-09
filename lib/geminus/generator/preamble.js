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
