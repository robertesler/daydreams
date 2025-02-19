import os

def change_file_extensions(folder_path, new_extension):
    # Iterate over all files in the specified folder
    for filename in os.listdir(folder_path):
        # Split the file name and extension
        base, ext = os.path.splitext(filename)
        # Create the new file name with the desired extension
        new_filename = base + new_extension
        # Construct the full file paths
        old_file = os.path.join(folder_path, filename)
        new_file = os.path.join(folder_path, new_filename)
        # Rename the file
        os.rename(old_file, new_file)
        print(f'Renamed: {filename} -> {new_filename}')

# Specify the folder path and new extension
folder_path = '../'
new_extension = '.mid'

# Change all file extensions in the folder
change_file_extensions(folder_path, new_extension)