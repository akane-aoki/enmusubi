// Import and register all your controllers from the importmap under controllers/*

// import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// lazyLoadControllersFrom("controllers", application)
