Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gwyn.tux.org (gwyn.tux.org [207.96.122.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 542E2482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Jan 2002 12:47:19 -0700 (MST)
Received: (from timball@localhost)
	by gwyn.tux.org (8.9.3/8.9.1) id OAA17448
	for parisc-linux@lists.parisc-linux.org; Sat, 26 Jan 2002 14:47:13 -0500
Date: Sat, 26 Jan 2002 14:47:13 -0500
From: Timothy Ball <timball@tux.org>
To: parics Linux Mailing List <parisc-linux@lists.parisc-linux.org>
Subject: [timball@tux.org: Re: [parisc-linux] 712/60, 2.4.17-pa13, debian testing, php4 and apache don't work.. -- SOLVED]
Message-ID: <20020126194713.GD5722@gwyn.tux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Forgot to CC: the list... how does one request a pkg to be rebuilt?

--timball

----- Forwarded message from Timothy Ball <timball@tux.org> -----
On Sat, Jan 26, 2002 at 01:22:28PM +0200, Mikko Palo wrote:
> Sigh, I hate to reply myself, but..
> 
> Problem solved, had to compile apache, mm and php4 from source using
> apt-get source --build XXXX command. Now everything working very
> perfectly..
> 
> Keep working good job, guys! :)
> 

Actually all you had to do was recompile libmm11... I fixed this problem
this morning by just recompiling libmm11. I suppose it would be nice to
see if this issue is related to the cross compiling of pkgs.

--timball

----- End forwarded message -----

-- 
	GPG key available on pgpkeys.mit.edu
pub  1024D/511FBD54 2001-07-23 Timothy Lu Hu Ball <timball@tux.org>
Key fingerprint = B579 29B0 F6C8 C7AA 3840  E053 FE02 BB97 511F BD54
