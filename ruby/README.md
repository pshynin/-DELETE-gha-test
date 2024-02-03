### How to run
- Install the gems and its dependencies: `bundle install --path vendor/bundle`
- Make sure you have the bundle command installed. If not, you can install it using: `gem install bundler`
- Run the application: `bundle exec ruby lib/task_manager/task_manager.rb`

### How to test
- Run the tests: `rspec`
  - Run the tests with coverage: `rspec COVERAGE=true rspec`
- If you don't have the rspec gem installed, you can install it using: `gem install rspec`

### Project structure:

```agsl
ruby/
│
├── Gemfile                   # Project dependencies using Bundler
├── Gemfile.lock
├── Rakefile                  # Define custom Rake tasks
├── README.md
├── config/
│   ├── application.yml       # Shared configuration files
│   └── environment.rb        # Environment setup
│
├── lib/
│   ├── task_manager/         # Application One
│   │   └── task_manager.rb   # Application One main file
│   │
│   ├── app_two/              # Application Two
│   │   └── app_two.rb        # Application Two main file
│   │
│   └── shared/               # Shared code/modules
│       └── helpers/
│
├── spec/                     # Unit tests
│   └── spec_helper.rb        # Shared test setup
│
└── tasks/                   
    └── tasks.rake            # Custom Rake tasks
```