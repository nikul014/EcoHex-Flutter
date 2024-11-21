import '../model/community_challenge_model.dart';

class DataConstants {
  static String weeklyChallengesJson = '''
{
  "weeklyChallenges": [
    {
      "challengeId": "eco_challenge_001",
      "title": "Environment Friendly Clothing Materials",
      "description": "This weekly challenge is all about learning about eco-friendly clothing materials and their positive impact on the environment. By the end of the challenge, you'll have a better understanding of how your clothing choices can help preserve the planet.",
      "startDate": "2024-11-01",
      "endDate": "2024-11-07",
      "pointsForCompletion": 100,
      "impactDetails": [
        {
          "pageTitle": "What is Environmentally Friendly Clothing?",
          "image": "assets/icons/drawables/fashion1.jpeg",
          "text": "Environmentally friendly clothing is made from materials that have minimal impact on the environment. These include organic cotton, hemp, bamboo, and recycled fabrics. These materials are grown and processed using fewer chemicals and resources compared to conventional fabrics."
        },
        {
          "pageTitle": "How Eco-Friendly Clothing Saves the Environment",
          "image": "assets/icons/drawables/fashion2.jpg",
          "text": "By opting for eco-friendly materials, we reduce the carbon footprint of clothing production. These materials require less water, pesticides, and synthetic dyes, which in turn helps to preserve water resources, reduce pollution, and minimize landfill waste."
        },
        {
          "pageTitle": "The Benefits of Organic Cotton",
          "image": "assets/icons/drawables/fashion3.webp",
          "text": "Organic cotton is a key player in sustainable fashion. Unlike conventional cotton, organic cotton is grown without the use of synthetic fertilizers or pesticides, making it less harmful to the environment and the people who work with it."
        }
      ],
      "quizQuestions": [
        {
          "question": "Which of the following materials is considered eco-friendly for clothing?",
          "options": [
            "Nylon",
            "Polyester",
            "Organic Cotton",
            "Acrylic"
          ],
          "correctAnswer": "Organic Cotton",
          "points": 25
        },
        {
          "question": "What is the primary environmental benefit of using eco-friendly clothing materials?",
          "options": [
            "It helps to preserve water and reduces pollution.",
            "It increases the production of synthetic dyes.",
            "It uses more pesticides and chemicals.",
            "It requires more resources to produce."
          ],
          "correctAnswer": "It helps to preserve water and reduces pollution.",
          "points": 25
        },
        {
          "question": "How does organic cotton differ from conventional cotton?",
          "options": [
            "It is grown with fewer pesticides and fertilizers.",
            "It requires more synthetic dyes.",
            "It needs more water to grow.",
            "It is not biodegradable."
          ],
          "correctAnswer": "It is grown with fewer pesticides and fertilizers.",
          "points": 25
        },
        {
          "question": "Which fabric is considered a sustainable alternative to traditional cotton?",
          "options": [
            "Hemp",
            "Polyester",
            "Nylon",
            "Rayon"
          ],
          "correctAnswer": "Hemp",
          "points": 25
        }
      ]
    },
    {
      "challengeId": "eco_challenge_002",
      "title": "Plastic Waste Reduction",
      "description": "In this challenge, you will explore the impact of plastic waste on the environment and learn how reducing plastic consumption can lead to a cleaner, healthier planet.",
      "startDate": "2024-11-08",
      "endDate": "2024-11-14",
      "pointsForCompletion": 150,
      "impactDetails": [
        {
          "pageTitle": "The Impact of Plastic Waste",
          "image": "assets/icons/drawables/plastic1.avif",
          "text": "Plastic waste is one of the biggest environmental issues today. It takes hundreds of years for plastic to decompose, and during this time, it harms wildlife and pollutes our oceans, rivers, and forests."
        },
        {
          "pageTitle": "How Reducing Plastic Use Helps",
          "image": "assets/icons/drawables/plastic2.webp",
          "text": "By reducing our use of single-use plastics, we help to reduce the amount of plastic waste that ends up in landfills and oceans. Simple changes like using reusable bags, bottles, and containers can make a significant difference."
        },
        {
          "pageTitle": "Alternatives to Plastic",
          "image": "assets/icons/drawables/plastic3.webp",
          "text": "There are many eco-friendly alternatives to plastic, such as glass, metal, bamboo, and biodegradable plastics. These materials break down more easily and do not contribute to the growing plastic pollution problem."
        }
      ],
      "quizQuestions": [
        {
          "question": "What is the main environmental issue caused by plastic waste?",
          "options": [
            "It contributes to global warming.",
            "It harms wildlife and pollutes ecosystems.",
            "It generates more waste in landfills.",
            "It uses too many resources to manufacture."
          ],
          "correctAnswer": "It harms wildlife and pollutes ecosystems.",
          "points": 50
        },
        {
          "question": "Which of the following is an alternative to plastic packaging?",
          "options": [
            "Bamboo",
            "Styrofoam",
            "Plastic film",
            "Aluminum foil"
          ],
          "correctAnswer": "Bamboo",
          "points": 50
        },
        {
          "question": "What can you do to reduce plastic waste?",
          "options": [
            "Buy more plastic products.",
            "Use single-use plastic bags.",
            "Switch to reusable containers and bags.",
            "Increase plastic production."
          ],
          "correctAnswer": "Switch to reusable containers and bags.",
          "points": 50
        }
      ]
    }
  ]
}
''';

  static final List<CommunityChallenge> challenges = [
    CommunityChallenge(
      challengeName: "Eco-Friendly Run",
      image: "https://guelph.ca/wp-content/uploads/landing-environment.jpg",
      startDate: "2024-12-01",
      endDate: "2024-12-10",
      points: "200 pts",
      locationAddress: "123 Greenway Street, Green City, GC 12345",
      startTime: "08:00 AM",
      endTime: "12:00 PM",
      description:
          "Participate in a community run focused on raising environmental awareness. Runners are encouraged to reduce litter and promote eco-friendly habits.",
    ),
    CommunityChallenge(
      challengeName: "Recycling Drive",
      image:
          "https://t3.ftcdn.net/jpg/05/78/65/98/360_F_578659816_v2ZJMwlpFisEE66gWt6h3POodHeLYseI.jpg",
      startDate: "2024-11-25",
      endDate: "2024-11-28",
      points: "10-5000 pts",
      locationAddress: "Community Center, 456 Recycle Ave, Eco Town, ET 67890",
      startTime: "09:00 AM",
      endTime: "05:00 PM",
      description:
          "Join us in this recycling drive and help reduce waste in your community. Earn points by bringing in recyclable items and learn more about sustainable living.",
    ),
    CommunityChallenge(
      challengeName: "Plant a Tree Challenge",
      image:
          "https://www.fastweb.com/uploads/article_photo/photo/2036160/Simple_Environment.jpeg",
      startDate: "2024-11-30",
      endDate: "2024-12-15",
      points: "100 pts",
      locationAddress: "789 Nature Blvd, Forest Hills, FH 23456",
      description:
          "Contribute to a greener future by planting trees in designated areas. Participants will receive guidance and support to ensure sapling survival.",
    ),
    CommunityChallenge(
      challengeName: "Clean Beach Drive",
      image:
          "https://media.istockphoto.com/id/1486564860/photo/hand-of-human-holding-green-earth-with-tree-for-esg-co2-and-net-zero-concept-of-world.jpg?s=612x612&w=0&k=20&c=P851EsOMSZVKIi9rzhRpKcsxLjnjI053egtRlyQKckc=",
      startDate: "2024-12-05",
      endDate: "2024-12-05",
      points: "300-1500 pts",
      locationAddress: "Sunset Beach, Coastal City, CC 78901",
      startTime: "07:00 AM",
      endTime: "01:00 PM",
      description:
          "Help preserve our coastlines by joining a collective beach clean-up. All tools and materials will be provided, and participants can make a real difference.",
    ),
    CommunityChallenge(
      challengeName: "Reduce Energy Usage Week",
      image:
          "https://geog.cms.arts.ubc.ca/wp-content/uploads/sites/26/2020/09/GEOG-BA-Environment-Sustainability-Banner-V2.jpg",
      startDate: "2024-12-10",
      endDate: "2024-12-17",
      points: "500 pts",
      locationAddress: "Online Challenge",
      description:
          "Commit to reducing your energy usage for a week through small, impactful changes. Track your progress online and share your energy-saving tips.",
    ),
  ];
}
