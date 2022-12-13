const { ApolloServer, gql } = require('apollo-server');
const { PrismaClient } = require('@prisma/client')
const fs = require('fs');
const path = require('path');

const prisma = new PrismaClient()

// 1
const typeDefs = fs.readFileSync(path.join(__dirname, 'src/schema.graphql'), 'utf8')


const resolvers = {
	Query: {
		ordersForUser: (parent, args, context) => {
			return context.prisma.order.findMany({
				where: {
					owner: {
						id: parseInt(args.userId)
					}
				}
			})
		},
		users: (parent, args, context) => {
			return context.prisma.user.findMany()
		}

	},
	// User: {
	// 	orders: (parent, args, context) => {
	// 		return context.prisma.user
	// 			.findUnique({
	// 				where: { id: parent.id },
	// 			})
	// 			.orders()
	// 	},
	// },
	Order: {
		owner: (parent, args, context) => {
			return context.prisma.order
				.findUnique({
					where: { id: parent.id },
				}).owner()
		},
	}

	// Mutation: {
	// 	post: (parent, args, context, info) => {
	// 		const newLink = context.prisma.link.create({
	// 			data: {
	// 				url: args.url,
	// 				description: args.description,
	// 			},
	// 		})
	// 		return newLink
	// 	},
	// }
}



// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer({
	typeDefs,
	resolvers,
	context: {
		prisma,
	},
	csrfPrevention: true,
	cache: 'bounded',
});

// The `listen` method launches a web server.
server.listen().then(({ url }) => {
	console.log(`🚀  Server ready at ${url}`);
});