Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DE5E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jan 2002 11:45:34 -0700 (MST)
To: "Sorin Ghinescu" <sghinesc@columbus.rr.com>
Cc: parisc-linux@lists.parisc-linux.org, taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] 712/80 - 7cdroms - scsi prbl 
In-Reply-To: Your message of "Thu, 10 Jan 2002 12:39:23 EST."
             <001001c199fd$ca7fe700$0800a8c0@beta>
References: <001001c199fd$ca7fe700$0800a8c0@beta> 
Date: Thu, 10 Jan 2002 11:45:32 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020110184532.9876E37D2B@carmen.fc.hp.com>
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

"Sorin Ghinescu" writes...

> Hi guys,
> I'm trying to install parisc-linux on 712/80.
> I don't know if this is actually an OS problem or a hardware problem but
> you may have experienced it and could help me.
> I'm booting from my external cd-rom but it seems that the kernel is
> fooled by something because it creates 7 cd-rom devices for all the scsi
> targets available leaving no room for the hd. If I switch the cd-rom off
> then I get 7 hds!
> Has anyone experienced this?

Check and make sure that none of your scsi ids are conflicting, don't
forget the controller is at id 7. Also check your cables and termination.
If it still doesn't work try a different hard drive.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
