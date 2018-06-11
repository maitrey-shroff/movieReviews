import ('/../movies.js');

describe("A suite", function() {
  it("should go to the next", function() {
    expect(methods.nextPage()).toEqual(2);
  });
});