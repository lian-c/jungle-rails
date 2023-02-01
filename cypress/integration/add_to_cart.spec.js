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
  
  it("before add button My Cart should show 'My Cart (0)", () => {
    cy.get('.nav-item.end-0').contains('My Cart (0)')
  });
  
  
  it("when add button is clicked  My Cart should show 'My Cart (1)", () => {
    cy.get("form").first().submit()
    cy.get('.nav-item.end-0').contains('My Cart (1)')
  });
  

  
})