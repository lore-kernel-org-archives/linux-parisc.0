Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.comcast.net (smtp.comcast.net [24.153.64.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67B724830
	for <parisc-linux@parisc-linux.org>; Sat, 13 Jul 2002 15:59:38 -0600 (MDT)
Received: from haydn (pcp357875pcs.elictc01.md.comcast.net [68.55.155.46])
 by mtaout03.icomcast.net
 (iPlanet Messaging Server 5.1 HotFix 0.8 (built May 13 2002))
 with SMTP id <0GZ7001H8JRDQ7@mtaout03.icomcast.net> for
 parisc-linux@parisc-linux.org; Sat, 13 Jul 2002 17:59:37 -0400 (EDT)
Date: Sat, 13 Jul 2002 17:57:40 -0400
From: Frank Alden Smith <falden@comcast.net>
To: parisc-linux@parisc-linux.org
Message-id: <NGBBJKHCMLEJELIEEHNOCEDPCAAA.falden@comcast.net>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] locales held back
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

hi,

For the last two days I've been told by apt-get upgrade that the locales
package has been held back. Today I decided to try apt-get install
locales with this result:

puccini:~# apt-get install locales
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
  locales: Depends: glibc-2.2.5-8 but it is not installable
E: Sorry, broken packages

Any, idea how I can resolve the problem, or must I just be patient until
the broken glibc-2.2.5-8 is fixed?

Take care,
frank
