library d3.utils;

typedef FnWith0Args();
typedef FnWith1Args(a0);
typedef FnWith2Args(a0, a1);
typedef FnWith3Args(a0, a1, a2);
typedef FnWith4Args(a0, a1, a2, a3);


FnWith4Args relaxFnArgs(Function fn) {
  if (fn is FnWith4Args) {
    return (a0, a1, a2, a3) => fn(a0, a1, a2, a3);
  } else if (fn is FnWith3Args) {
    return (a0, a1, a2, a3) => fn(a0, a1, a2);
  } else if (fn is FnWith2Args) {
    return (a0, a1, a2, a3) => fn(a0, a1);
  } else if (fn is FnWith1Args) {
    return (a0, a1, a2, a3) => fn(a0);
  } else if (fn is FnWith0Args) {
    return (a0, a1, a2, a3) => fn();
  } else {
    return (a0, a1, a2, a3) {
      throw "Unknown function type, expecting 0 to 4 args.";
    };
  }
}