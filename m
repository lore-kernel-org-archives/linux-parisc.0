Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDE674829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 06:26:39 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 181QmR-0007le-00; Tue, 15 Oct 2002 13:26:35 +0100
Date: Tue, 15 Oct 2002 13:26:35 +0100
From: Matthew Wilcox <willy@debian.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Dump driver: step by step
Message-ID: <20021015132635.D8660@parcelfarce.linux.theplanet.co.uk>
References: <3DABF865.8224BF5@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DABF865.8224BF5@admin.france.hp.com>; from bruno_vidal@hpfrcu03.france.hp.com on Tue, Oct 15, 2002 at 01:13:41PM +0200
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

On Tue, Oct 15, 2002 at 01:13:41PM +0200, Bruno Vidal wrote:
> 	Hi.
> I've succeded to read with iodc, and at the right place (good news no).
> Now I'll try to write. But I prefer to do it on another disk.
> So I've found an old scsi SE. I've plugged it. The driver is able
> to find the hpa, retrieve the iodc ENTRY_INIT without any pb.
> But when calling the ENTRY_INIT with INIT_MOD_DEV or only INIT_DEV
> it fail with return code -9. But there is a little pb, I don't
> have this return code in documentation. If I believe the the 
> "parisc 1.1 IO firmware Architecture".
> I didn't find it for parisc 2.0 (on 
> http://www.parisc-linux.org/documentation/index.html). 
> So if someone know where I can find it.

	-9	Cannot locate a console device or boot device
		The search could not locate a console device or
		boot device on the module. Returned
		only by options ARG1=2 and ARG1=3.
		CONDITIONAL. Must be used if the search options are provided.

-- 
Revolutions do not require corporate support.
