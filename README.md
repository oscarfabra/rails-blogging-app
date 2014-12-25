rails-blogging-app
==================

Sample Collaborative Writing Application Developed with Devise 3 over Rails 4. It's a basic web application that facilitates collaborative writing. Its basic functionalities are as follows:
* Guest users (not logged-in users) can read non-restricted posts.
* Only logged-in users can create posts.
* An administrator user can do anything he/she wants.
* A user can delete his/her own posts; he/she cannot delete posts created by other users.
* A restricted post is a post that can be viewed by its creator and the collaborators chosen by him/her. If there is no collaborator, only the creator can see the restricted post.
* Many users can edit a post, if the post creator chooses to collaborate with them.
