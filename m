Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout08.sul.t-online.com (mailout08.sul.t-online.com [194.25.134.20])
	by dsl2.external.hp.com (Postfix) with ESMTP id 261294829
	for <parisc-linux@parisc-linux.org>; Sun,  6 Apr 2003 15:51:35 -0600 (MDT)
Received: from nikita.ath.cx (localhost [127.0.0.1])
	by nikita.ath.cx (8.12.3/8.12.3/Debian-5) with ESMTP id h36LqR0H007221
	for <parisc-linux@parisc-linux.org>; Sun, 6 Apr 2003 23:52:28 +0200
Received: (from pappy@localhost)
	by nikita.ath.cx (8.12.3/8.12.3/Debian-5) id h36LqLjC007219
	for parisc-linux@parisc-linux.org; Sun, 6 Apr 2003 23:52:21 +0200
From: Alexander Gabert <pappy@nikita.ath.cx>
Date: Sun, 6 Apr 2003 23:52:19 +0200
To: parisc-linux@parisc-linux.org
Message-ID: <20030406215219.GA7192@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] grsecurity 199e on 2420pa32
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

fyi

bye,

Alex

----
this weekend i succeeded in setting up my first debian-hppa box with a
customized parisc-linux.org kernel with the grsecurity 1.9.9e patch.

with the help of Brad Spengler it was possible to fit his patch to the
latest parisc-linux 2.4.20 kernel and set up a demo machine.

the patches are at http://nikita.ath.cx/users/pappy/grsec

i also provided a compiled kernel (without module support) for a 712 and
a config file for grsec for evaluational purposes.

please feel free to follow me up and ask questions about this.
the box is currently running and the 2 minor issues with PAGE EXEC
should be resolved in the near future.

i am looking forward to 2.0 where grsec will come up with role-based
behaviour and full distinction support for remote/local processes via
ip-based access control lists.

as far as i know, the grsec functionality is the first project to
effectively harden the linux kernel for hp/9000 machines.

www.grsecurity.net has details about the functionality provided by
Brad's team.

a comparison to the commercial HP/9000 praesidium IDS from HP would be
welcome.

have a nice day,


Alex
-- 
pub  1024/05E1A80C 2001/12/16 Alexander Gabert (http://nikita.ath.cx) <pappy@nikita.ath.cx>
          Key fingerprint =  2D 84 B0 CB F5 67 8A 22  8D 37 6E 6B 8A 3B 7F D6  05 E1 A8 0C


-- 
To UNSUBSCRIBE, email to debian-hppa-request@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org


----- End forwarded message -----

-- 
"... an experienced, industrious, ambitious, and often quite often
picturesque liar."
                -- Mark Twain

pub  1024/05E1A80C 2001/12/16 Alexander Gabert (http://nikita.ath.cx) <pappy@nikita.ath.cx>
          Key fingerprint =  2D 84 B0 CB F5 67 8A 22  8D 37 6E 6B 8A 3B 7F D6  05 E1 A8 0C
