From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] Git snaps pb with http?
Date: Thu,  9 Aug 2007 10:10:36 +0200
Message-ID: <JMHYPO$B8A03EB59514846D34A78BD0B762C486__44832.8428356492$1416624426$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "kyle" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Kyle,

Some time ago, I discover your interesting snapshot tree:
<http://git.kernel.org/?p=3Dlinux/kernel/git/kyle/linux-2.6-snaps.git;a=3D=
summary>

Saying today:
[snip]
description: Daily git snapshots of Linus' tree 
owner: Kyle McMartin 
last change: Tue, 7 Aug 2007 01:31:43 +0000 
URL git://git.kernel.org/pub/scm/linux/kernel/git/kyle/linux-2.6-snaps.gi=
t 
 http://www.kernel.org/pub/scm/linux/kernel/git/kyle/linux-2.6-snaps.git =

[snip]

At home I can use git protocol and there is any pb to update my local tre=
e
with 'git-pull'

But at the office I can just use http protocol.
Here even thought I grab an initial tree with:
git-clone \
http://www.kernel.org/pub/scm/linux/kernel/git/kyle/linux-2.6-snaps.git \=

linux-2.6-snaps.git

some weeks ago, each time I try to update this local tree:
# git-pull  2>&1 | tee -a /var/logs/KyleSnapsGit26.log
Fetching refs/heads/master from
http://www.kernel.org/pub/scm/linux/kernel/git/kyle/linux-2.6-snaps.git u=
sing http
Already up-to-date.

While I'm sure there was updates.

Is there some known issue I missed about http protocol usage?

Tx,
    J.=0A---=0APack Scarlet One, ADSL 6 Mbps + Telephonie, a partir de EU=
R 29,95...=0Ahttp://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
