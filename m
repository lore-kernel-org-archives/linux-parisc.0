Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (gapserver.centraltx.com [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DCA4482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 23:24:33 -0600 (MDT)
Date: Thu, 30 May 2002 00:23:49 -0500
Message-Id: <200205300023.AA908198370@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Java and SSH
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I got ssh up and running. Also, why does it bomb when I uncomment the line in my sources.list that has to do with the security updates?? I have network
connectivity now, and heres what I get for the
java possibilities:

seki:/etc/apt# more sources.list

deb cdrom:[Debian GNU/Linux 3.0 prerelease _Woody_ - Unofficial hppa Binary-1 (2
0011205)]/ unstable contrib main
deb http://non-us.debian.org/debian-non-US unstable non-US/main non-US/contrib n
on-US/non-free
deb http://http.us.debian.org/debian/ unstable main non-free contrib
deb-src http://http.us.debian.org/debian/ unstable main non-free contrib
# deb http://security.debian.org/ unstable updates/main updates/contrib updates/
non-free





seki:/etc/apt# apt-get install jikes
Reading Package Lists... Done
Building Dependency Tree... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.

Since you only requested a single operation it is extremely likely that
the package is simply not installable and a bug report against
that package should be filed.
The following information may help to resolve the situation:

Sorry, but the following packages have unmet dependencies:
  jikes: Depends: java-virtual-machine but it is not installable
E: Sorry, broken packages
seki:/etc/apt# apt-get install kaffe
Reading Package Lists... Done
Building Dependency Tree... Done
Package kaffe has no available version, but exists in the database.
This typically means that the package was mentioned in a dependency and
never uploaded, has been obsoleted or is not available with the contents
of sources.list
E: Package kaffe has no installation candidate



---------- Original Message ----------------------------------
From: Grant Grundler <grundler@dsl2.external.hp.com>
Date:  Wed, 29 May 2002 14:13:34 -0600

>"marc " wrote:
>> `apt-cache search ssh` returns nothing.
>> Any other ideas?
>
>verify you have non-us in your /etc/apt/sources.list.
>Something like:
>deb http://non-us.debian.org/debian-non-US unstable/non-US main contrib non-free
>
>
>grundler <515>dpkg -l ssh
>Desired=Unknown/Install/Remove/Purge/Hold
>| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
>|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
>||/ Name           Version        Description
>+++-==============-==============-============================================
>ii  ssh            3.0.2p1-9      Secure rlogin/rsh/rcp replacement (OpenSSH)
>
>
>grant
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
