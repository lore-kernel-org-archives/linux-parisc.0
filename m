Return-Path: <hppa-linux@puffingroup.com>
From: "Steven A. DuChene" <sduchene@mindspring.com>
Message-ID: <19990219230705.K4360@sduchene.users.mindspring.com>
Date: Fri, 19 Feb 1999 23:07:05 -0500
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] Partitioning proposal for boot loader
References: <199902191929.NAA11346@equator.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199902191929.NAA11346@equator.com>; from Jason Eckhardt on Fri, Feb 19, 1999 at 01:29:01PM -0600
Resent-Message-ID: <"rJ2EC3.0.Bm7.BMZps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

I also agree that if we want different OS in a single box we
should rely on seperate disks. HP-UX doesn't support different OS
'es on a single disk and doesn't really support partitions in general
other than allocating a swap area (except LVM). BTW, there is a page
on LVM for Linux. I can dig this up and this would be something good
to incorperate in HPPA-linux since this is what is native for most
HP-UX systems these days.
-- 
Steven A. DuChene   Linux Fan!  http://www.mindspring.com/~sduchene

Outside of a dog, a book is a man's best friend. Inside a dog it's
too dark to read.
                -- Groucho Marx

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
