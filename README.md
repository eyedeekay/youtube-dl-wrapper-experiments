# yget

A wrapper around youtube-dl for the particular.

## description

The best way to explain what, in this case, is to explain why. I download stuff
from youtube alot, and to do so I use youtube-dl. But when a file is very large,
it becomes onerous to download because the youtube-dl process runs in the
foreground and sends output to stdout. Of course, you can simply fork it into
the background, but what if you need to interrupt the download? Well if you have
just one youtube-dl instance you could 'killall youtube-dl' but if you have more
than one you'll have to figure out which youtube-dl process to kill.

What this script does is isolates the data required to identify and control the
youtube-dl process in the folder where the command is run. It does this by
capturing the PID of the youtube-dl process, redirecting it's output, and
monitoring it with a supervisor until the process completes. Then, from the
download directory, you can view the progress by viewing the file output and
kill the process with a command or by writing to a named pipe. And enough
metadata is stored on the client that the download can easily be restarted by
running the command again with no arguments. It also can be used to provide an
alternate set of arguments to the youtube-dl command.

## usage

Start a download from a url:

        yget $video_url

Stop a download by killing the process:

        yget -k

Resume a previous download from within the download directory.

        yget

## structure

The folder structure generated by yget looks like the following.

        download_folder/>log
                       /2>err
                       /stop
                       /vars.sh || />vars.sh