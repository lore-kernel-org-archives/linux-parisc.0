Return-Path: <hppa-linux@puffingroup.com>
Date: Tue, 16 Feb 1999 01:13:46 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: hppa-linux@puffingroup.com
Message-ID: <Pine.LNX.3.96.990216010824.22132I-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [hppa-linux] RMP booting
Resent-Message-ID: <"CzrZM.0.CW4.rpGos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


Okay, I've found the source for booting via RMP on the HPs.  I've rebuilt
the source, it is in:

http://www.puffingroup.com/hppa-linux/rpms/rbootd-2.0-1.i386.rpm
http://www.puffingroup.com/hppa-linux/rpms/rbootd-2.0-1.src.rpm

Now, it seems to react properly to rmp requests from my HP 715, but
somehow there's a problem with rbootd where it doesn't precalculate the
filename in SendBootRepl() in rmpproto.c.  I'm not quite sure where the
problem is there, but I'll look closer tomorrow.

The symptom of the problem is that on the server end I always get the
following in the logs:

Feb 17 01:53:12 blue rbootd[7195]: 08:00:09:87:e4:8f: request to boot
(denied)

whereas the format of the string is:

"%s: request to boot %s (%s)",
               EnetStr(rconn), filename, retval? "granted": "denied");

So clearly filename isn't being set properly.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
HPPA/Linux Porting Team


----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
