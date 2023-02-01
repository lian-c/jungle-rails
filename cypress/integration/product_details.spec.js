describe('Jungle rails app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3000/')
  })
  it('displays the title', () => {
    cy.get('.title > h1').should('have.text', 'The Jungle')
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });


  it("Should show product show section", () => {
    cy.get(".products article").first().click()
    cy.get(".products-show").should('be.visible')
  });
  
  it("Should show Scented Blade for first product when clicked", () => {
    cy.get(".products article").first().click()
    cy.get(".product-detail h1").should('have.text', 'Scented Blade')
  });
  
})