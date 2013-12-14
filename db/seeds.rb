projects = [
  {
    name: "Person",
    country: "France",
    description: "Raise Money",
    profile_url: "http://www.google.com",
    avatar_url: "https://pbs.twimg.com/profile_images/3316617713/bef6064bf48428aab4064a9b791b085a.jpeg",
    target_amount: 1999.99,
    raised_amount: 100.00
  }
]

projects.each do |project|
  Project.create(project)
end
