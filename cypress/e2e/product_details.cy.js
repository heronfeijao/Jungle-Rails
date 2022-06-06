describe("Open Product", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Click on the product", () => {
    cy.get(".products article")
      .first()
      .click();
  });

});