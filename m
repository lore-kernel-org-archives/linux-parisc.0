From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Missing syscalls in 2.6.30-rc4
Date: Fri, 1 May 2009 21:28:19 -0400 (EDT)
Message-ID: <20090502012823.955BA4E9F@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following syscalls aren't wired up:

<stdin>:1421:2: warning: #warning syscall preadv not implemented
<stdin>:1425:2: warning: #warning syscall pwritev not implemented

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
