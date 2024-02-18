import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(hostname:"localhost",username: "postgres" , password: "", database: "movies")  , as: .psql)
    
    app.migrations.add(CreateMovie())
    
    app.migrations.add(CreateReivew())

    app.migrations.add(CreateActor())

    app.migrations.add(CretaeMovieActor())
    

    app.migrations.add(CreateTodo())
    
    
    try app.register(collection: MovieController())
    
    try app.register(collection: ActorController())

    try app.register(collection:  ReviewController())
    
    try app.register(collection: MovieActorrContoller())
    // register routes
    try routes(app)
}
