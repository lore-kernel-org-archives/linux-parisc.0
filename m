Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Sorin Ghinescu" <sghinesc@columbus.rr.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 712/80 - 7cdroms - scsi prbl 
In-Reply-To: Message from "Sorin Ghinescu" <sghinesc@columbus.rr.com>
   of "Thu, 10 Jan 2002 12:39:23 EST." <001001c199fd$ca7fe700$0800a8c0@beta>
References: <001001c199fd$ca7fe700$0800a8c0@beta> 
Date: Fri, 11 Jan 2002 12:10:24 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020111191024.CB9E6482A@dsl2.external.hp.com>
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

"Sorin Ghinescu" wrote:
> I'm booting from my external cd-rom but it seems that the kernel is
> fooled by something because it creates 7 cd-rom devices for all the scsi
> targets available leaving no room for the hd. If I switch the cd-rom off
> then I get 7 hds!

This typically means the HD is set to the same SCSI ID as the
interface controller (NCR 53c710 logic on LASI). Host ID is
7 by default. Verify the HD is set to something else.

It's possible the lasi scsi driver is broken and setting the
initiator to 0 (or something other than 7).

grant
