Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D45F482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 05:01:06 -0600 (MDT)
Date: Sat, 13 Oct 2001 11:00:57 +0000
From: Richard Allen <ra@hp.is>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] unaligned access with iptables limit support
Message-ID: <20011013110057.B16722@hp.is>
References: <Pine.LNX.4.33.0110130227590.13555-100000@lefou.zayda.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0110130227590.13555-100000@lefou.zayda.com>; from sonny@aspersion.org on Sat, Oct 13, 2001 at 05:08:12AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 13, 2001 at 05:08:12AM +0000, Sonny Cook wrote:
> I am trying to set up my b132l as a firewall.  So I compiled up iptables
> as kernel modules and tried running my favorite firewall script.  It uses
> limit support to keep my logs from overflowing.  At any rate when I try to
> enter a rule using limits like so:
> 
> iptables -t filter -A LDROP -p tcp -m limit --limit 2/s -j LOG --log-level
> info --lo g-prefix "TCP Dropped "

This is prehaps totally unrelated to what you are getting, but I recently
found another bug in iptables in the samr area:

[root@localhost root]# iptables --version
iptables v1.2.3

[root@localhost root]# uname -a
Linux localhost.localdomain 2.4.7-10 #1 Thu Sep 6 17:27:27 EDT 2001 i686 unknown

[root@localhost root]# cat /etc/redhat-release
Red Hat Linux release 7.2 (Enigma)

# Flush the iptables
[root@localhost root]# iptables -F

# Reject all access to port 25 tcp
[root@localhost root]# iptables -A INPUT -p tcp --syn --dport 25 -j REJECT

# Testing the rule. Connect is refused (normal)
[root@localhost root]# telnet 127.0.0.1 25
Trying 127.0.0.1...
telnet: connect to address 127.0.0.1: Connection refused

# Insert a rule that allows on connection per day to the SMTP port.
[root@localhost root]# iptables -I INPUT -p tcp --dport 25 -m limit --limit
+1/day --limit-burst 1 -j ACCEPT

# The connection is let through because of the limit (again normal).
[root@localhost root]# telnet 127.0.0.1 25
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
220 localhost.localdomain ESMTP Sendmail 8.11.6/8.11.6; Thu, 20 Sep 2001+19:50:12 GMT
quit
221 2.0.0 localhost.localdomain closing connection
Connection closed by foreign host.

# Try again, blocked because of limit (normal)
[root@localhost root]# telnet 127.0.0.1 25
Trying 127.0.0.1...
telnet: connect to address 127.0.0.1: Connection refused

# Insert a rule that allows access to port 21 tcp, nothing to do with port 25.
[root@localhost root]# iptables -I INPUT -p tcp --dport 21 -j ACCEPT

# Try to connect again to port 25 and it goes through (weird!)
[root@localhost root]# telnet 127.0.0.1 25
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
220 localhost.localdomain ESMTP Sendmail 8.11.6/8.11.6; Thu, 20 Sep 2001+19:51:19 GMT
quit
221 2.0.0 localhost.localdomain closing connection
Connection closed by foreign host.


So basicly, I have a rule that says only one connection to the smtp port
a day and it works untill I insert a new rule (and that rule doesnt have
to have anything to do with the first one) and by magic it breaks the
first one.

Beware of the limit support :-)

Anyway, if you guys are going to lookat this, it should be nice to
know about this bug also.

-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
