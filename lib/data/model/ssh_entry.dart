class SshEntry {
    final String identifier;
    final String sshKeyPassword;
    final String? userPassword;

    SshEntry({
        required this.identifier,
        required this.sshKeyPassword,
        this.userPassword
    });
}