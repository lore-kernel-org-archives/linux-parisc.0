From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Thu, 20 Nov 2008 10:14:38 -0500 (EST)
Message-ID: <20081120151439.1AF714EDF@hiauly1.hia.nrc.ca>
References: <492517F2.9060703@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <492517F2.9060703@gmx.de> from "Helge Deller" at Nov 20, 2008 08:55:30 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> But I continued with testing:
> 1) I modified James's ion-config for netbooting and built it. Crashed 
> same way as Dave just reported in another mail (DEBUG_BLOCK_EXT_DEVT is 
> enabled, you need to specify explicit textual name for "root=" boot option.)

In my case, the "root=" option was specified in the palo command line,
and I still got the error.  Tried booting several times and the same error
occurred each time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
