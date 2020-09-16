Specifications for the Sinatra Assessment
Specs:

 x Use Sinatra to build the app -- confirmed
 x Use ActiveRecord for storing information in a database -- database is used to store users and user posts
 x Include more than one model class (e.g. User, Post, Category) -- User model and Post model
 x Include at least one has_many relationship on your User model (e.g. User has_many Posts) -- User has_many posts
 x Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) -- Post belongs_to user
 x Include user accounts with unique login attribute (username or email) -- added to User model: validates :email, uniqueness: true
 x Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying -- a user can see their own posts, a specific user's posts, and all posts. A user can edit and delete their own posts. A user can create a new post.
 x Ensure that users can't modify content created by other users -- Users cannot edit or delete posts they did not create, and do not have the option to do so. created additional authorized_user? helper method.
 x Include user input validations -- included in Post model: validates :topic, :content, presence: true
 x BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) -- error messages from flash messages & validation messages
 Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Confirm

 x You have a large number of small Git commits
 x Your commit messages are meaningful
 x You made the changes in a commit that relate to the commit message
 x You don't include changes in a commit that aren't related to the commit message