From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: uid/gid issues on 2.6.26-rc2
Date: Sun, 18 May 2008 22:31:13 +0200
Message-ID: <7d01f9f00805181331y77b83a35jb897b622f163b0ef@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi pa-ckers

I'm sorry to be yet again just a whistle blower, I couldn't dig that
situation more yet but I'd like to raise awareness in case someone
else experiences the same symptoms. Also, what I'm seeing is a major
security flaw...

I'm running TOB on my A500 nosmp (when running SMP the timer code
borks gently). Randomly, the system seems to goof off regarding uids
and gids.

Typically, I'd ssh into the box as a regular user, and I end up with a
root prompt. Sometimes "w" will output nothing. dpkg will complain
about non-existing vlock group, etc.

Installing some package (with apt-get) I got the following message:
dpkg: syntax error: unknown group `vlock' in statoverride file
Trying again, it worked just fine

WRT ssh:

>From the remote host, I sometime got:
varenet@dogma:~$ ssh mkhppa3
ssh_exchange_identification: Connection closed by remote host

Trying again, I ended up with a root shell. Logging out and back in I
eventually got my own user's prompt.

Then, checking auth.log, I spotted a few very surprising things:

May 18 09:15:04 mkhppa3 sshd[1265]: Invalid user varenet from 147.215.7.200
May 18 09:15:04 mkhppa3 sshd[1265]: Failed none for invalid user
varenet from 147.215.7.200 port 58220 ssh2

May 18 20:50:04 mkhppa3 sshd[12623]: fatal: Privilege separation user
sshd does not exist
May 18 20:50:08 mkhppa3 sshd[12624]: Invalid user lucas from 147.215.7.12
May 18 20:50:08 mkhppa3 sshd[12624]: Failed none for invalid user
lucas from 147.215.7.12 port 59591 ssh2

(needless to say, user "sshd" exists locally and "varenet" and "lucas"
are on the ldap db. Plus, he could log in on a second attempt)

also:
May 18 12:17:01 mkhppa3 CRON[1302]: pam_unix(cron:account): could not
identify user (from getpwnam(root))

There's not much more evidence (couldn't find anything in other
logfiles or in dmesg...), but the box clearly didn't expose any such
symptom when running 2.6.22.14

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
