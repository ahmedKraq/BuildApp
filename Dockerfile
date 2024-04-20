# Use the official Ruby image from Docker Hub
FROM ruby:3.0.2

# Set the working directory in the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock from local machine to the container
COPY Gemfile Gemfile.lock ./

# Install dependencies using Bundler
RUN gem install bundler -v '2.3.5'

RUN bundle install

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Command to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]


