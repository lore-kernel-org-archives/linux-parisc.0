Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA18934
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 17:29:26 -0700
Message-Id: <199911250031.TAA24156@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress - Update
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Wed, 24 Nov 1999 19:31:08 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de, sieler@allegro.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <199911242055.PAA14777@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 24, 99 03:55:38 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I got a nice dump of the registers.  I think this shows that interruptions
> for bus errors are working.  The panic occured at sem_exit+2C when it
> tried to access location fffc5e6c.  I will try to determine how this address
> got used by sem_exit.

Anybody know where or how the pointer "current" is defined?  It is not 
in the map.  I think it is supposed to point current processes task_struct.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
