import os
import pty
import subprocess

def run_and_capture_tty_output(command):
    # Create a pseudo-terminal pair
    master_fd, slave_fd = pty.openpty()

    pty.
    
    try:
        # Start the subprocess with the slave end of the PTY as its TTY
        process = subprocess.Popen(
            command,
            stdin=slave_fd,
            stdout=slave_fd,
            stderr=slave_fd,
            close_fds=True
        )

        # Close the slave end in the parent process
        os.close(slave_fd)

        # Read output from the master end
        output = b""
        while True:
            try:
                data = os.read(master_fd, 1024)
                if not data:
                    break
                output += data
            except OSError:
                break

        # Wait for the subprocess to finish
        process.wait()
    finally:
        # Close the master end of the PTY
        os.close(master_fd)

    return output.decode()

# Example usage
# output = run_and_capture_tty_output(["bash", "-c", "echo 'This is TTY output!'"])
output = run_and_capture_tty_output(["./print.py"])
print("Captured output:", output)
