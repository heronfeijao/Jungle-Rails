describe("Add to Cart", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Clicks on the Add button", () => {
    cy.get('.btn').contains('Add')
      .click({force: true});
  });

  it("Cart should have 1 item", () => {
    cy.get('a[href*="/cart"]').contains('My Cart (1)');
  });
  
});