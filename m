Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED8454848
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 08:50:18 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3EEnxa32461; Wed, 14 Apr 2004 10:49:59 -0400
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
From: James Bottomley <James.Bottomley@steeleye.com>
To: Ryan Bradetich <rbradetich@uswest.net>
In-Reply-To: <1081953377.1089.76.camel@laptop.bradetich.net>
References: <40711E550000569F@ocpmta2.freegates.net>
	<1081953377.1089.76.camel@laptop.bradetich.net>
Content-Type: text/plain
Date: 14 Apr 2004 09:49:58 -0500
Message-Id: <1081954200.10872.10.camel@mulgrave>
Mime-Version: 1.0
Cc: Joel Soete <Soete.joel@tiscali.be>,
	PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>,
	Grant Grundler <grundler@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, 2004-04-14 at 09:36, Ryan Bradetich wrote:
> Ah .. I was under the impression it was a boot problem.  I will perform
> the find, fsck and tar tests tests ... I only have a small disk (~500MB)
> in the system so i will probably need to setup some external disks.  I
> will try the tests w/o using software raid first, then add in the
> software raid as a an additional variable.  This may take me a couple of
> days to get this accomplished (busy work schedule :().

It was (hence 'boot panic' in the title):

http://lists.parisc-linux.org/pipermail/parisc-linux/2004-March/022657.html

So, Joel, are you saying you no-longer see this boot panic problem?

James
