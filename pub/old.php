<?php
require('./../src/config.php');

?>

<form action="" method="post" enctype="multipart/form-data">
        <label for="uploadedFileInput">
            wybierz plik do wgrania:
        </label><br>
        <input type="file" name="uploadedFile" id="uploadedFileInput" required><br>
        <input type="submit" value="Wyślij plik" name="submit"><br>
</form>

<?php

    if(isset($_POST['submit']))  {
        Post::upload($_FILES['uploadedFile']['tmp_name']);
    }
?>
<?php
var_dump(Post::getPage());
?>
