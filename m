From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] what's in parisc-2.6.git
Date: Sat, 20 Oct 2007 15:17:50 -0400 (EDT)
Message-ID: <200710201917.l9KJHpPZ023957__19715.2252578691$1416624448$gmane$org@hiauly1.hia.nrc.ca>
References: <200710201724.l9KHOawa021786@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200710201724.l9KHOawa021786@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Oct 20, 2007 01:24:36 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Possibly, this caused by setting
> 
>   CONFIG_UEVENT_HELPER_PATH="/sbin/udevd"
> 
> "/sbin/hotplug" doesn't exist and there's no help for this option,
> so it's not obvious what to select.

Changing this back to the default "/sbin/hotplug" avoids this udev
problem, however the kernel HPMC'd at the end of the boot.  Aside
>from the hpmc log, there's not much info on what happened.

Back to 2.6.22.9,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
