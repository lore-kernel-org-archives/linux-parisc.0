From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH 3/5] parisc: use new macros for .data.init_task.
Date: Sat, 2 May 2009 10:04:01 -0400 (EDT)
Message-ID: <20090502140402.AC1124FC6@hiauly1.hia.nrc.ca>
References: <49FBD681.9080605@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: tabbott@MIT.EDU, sam@ravnborg.org, linux-kernel@vger.kernel.org,
	andersk@mit.edu, wdaher@mit.edu, vda.linux@googlemail.com,
	jbarnold@mit.edu, kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49FBD681.9080605@gmx.de> from "Helge Deller" at May 2, 2009 07:13:37 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> IIRC, gcc on hppa is not able to provide an alignment >= 8k, which is
> why we have done the 16k alignment inside the linker script.

How does this arise?  We have the following define for MAX_OFILE_ALIGNMENT
in elfos.h:

#define MAX_OFILE_ALIGNMENT (((unsigned int) 1 << 28) * 8)

If you are correct, MAX_OFILE_ALIGNMENT should be changed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
