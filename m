Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 66317487A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 07:48:25 -0600 (MDT)
Received: from postamt1.charite.de (postamt1.charite.de [193.175.66.246])
	by hauptpostamt.charite.de (Postfix) with ESMTP id A98F815C00A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 15:48:23 +0200 (CEST)
Date: Mon, 15 Jul 2002 15:48:23 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] K class, powerpc and stability
Message-ID: <20020715134823.GW12241@charite.de>
References: <3D32D1BE.5020707@itp.bg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D32D1BE.5020707@itp.bg>
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

On Mon, Jul 15, 2002 at 04:44:30PM +0300, Stephan Trajkoff wrote:

> I think that HPPA run better than AIX 4.1.4 on PowerPC 7248-120:)
> my K class servers are perfect:)))
> Btw, which K class, K200,K210 or K3xx?
> My K class has STI framebuffer, lasi i82596, scsi ncr53c720 running with 
> zalon driver
> The problem is that when I torming my machine with compilation my 'ps 
> ax' and 'w' hangs...:(((
> But for 2 weeks no one time my machine hangs??!?!?!

I think this is the known SMP problem.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
          Yesterday it worked.
          Today it is not working.
          Windows is like that.
