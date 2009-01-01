From: Helge Deller <deller@gmx.de>
Subject: Re: uid/gid issues on 2.6.26-rc2
Date: Thu, 01 Jan 2009 11:31:33 +0100
Message-ID: <495C9B85.3000009@gmx.de>
References: <7d01f9f00805181331y77b83a35jb897b622f163b0ef@mail.gmail.com> <20081228005346.GA22574@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081228005346.GA22574@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
> On Sun, 18 May 2008, Thibaut VARENE wrote:
> 
>> Then, checking auth.log, I spotted a few very surprising things:
>>
>> May 18 09:15:04 mkhppa3 sshd[1265]: Invalid user varenet from 147.215.7.200
>> May 18 09:15:04 mkhppa3 sshd[1265]: Failed none for invalid user
>> varenet from 147.215.7.200 port 58220 ssh2
> 
> I have seen this today testing 2.6.28 (32-bit UP).  The problem is also
> present in postfix:
> 
> dave@hiauly6:/var/log$ less mail.err
> Dec 27 12:45:41 hiauly6 postfix/sendmail[16726]: fatal: file /etc/postfix/main.cf: parameter mail_owner: unknown user name value: postfix
> 
> The only place this can occur is here:
> 
> static void check_mail_owner(void)
> {
>     struct passwd *pwd;
> 
>     if ((pwd = getpwnam(var_mail_owner)) == 0)
> 	msg_fatal("file %s/%s: parameter %s: unknown user name value: %s",
> 		  var_config_dir, MAIN_CONF_FILE,
> 		  VAR_MAIL_OWNER, var_mail_owner);
> 
> So, the problem is with getpwnam.  I don't see this with 2.6.22.19, so
> the problem is likely a syscall issue.  These seem to be the syscalls
> that directly relate to the getpwnam call:
> 
> open("/lib/libnss_files.so.2", O_RDONLY) = 3
> read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0$\f\0\0\0004\0"..., 512) = 512
> fstat64(3, {st_mode=0, st_size=0, ...}) = 0
> mmap(NULL, 52324, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x40b92000
> mmap(0x40b9e000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xb000) = 0x40b9e000
> close(3)                                = 0
> munmap(0x4051b000, 30889)               = 0
> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40006000
> open("/etc/passwd", O_RDONLY|O_CLOEXEC) = 3
> fcntl64(3, F_GETFD)                     = 0x1 (flags FD_CLOEXEC)
> _llseek(3, 0, [0], SEEK_CUR)            = 0
> fstat64(3, {st_mode=0, st_size=0, ...}) = 0
> mmap2(NULL, 1557, PROT_READ, MAP_SHARED, 3, 0) = 0x407ae000
> _llseek(3, 1557, [1557], SEEK_SET)      = 0
> munmap(0x407ae000, 1557)                = 0
> close(3)                                = 0
> exit_group(0)                           = ?
> 
> The failure appears random.  I think the problem occurs shortly after
> forking.  It doesn't seem to be present in the 64-bit SMP 2.6.28 test
> kernel that I'm testing.

I think your assumption that it is related to fork might be correct.
I don't see the uid/gid issues, but instead very often when I ssh the first
time into the 32bit kernel of a parisc box this message:
[deller@halden deller]$ ssh c3000 -Xl root
ssh_exchange_identification: Connection closed by remote host

But the second try suddenly works:
[deller@halden deller]$ ssh c3000 -Xl root
Password:

It appears random as well, and since I think sshd forks itself, it could
be that we have some fork()-problem...

Helge
