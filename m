From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] C3600 crash with PCMCIA bridge
Date: Sat, 7 Oct 2006 11:27:52 -0400 (EDT)
Message-ID: <200610071527.k97FRruf011292@hiauly1.hia.nrc.ca>
References: <20061007165519.d85d8839.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: gmsoft@tuxicoman.be (Guy Martin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061007165519.d85d8839.gmsoft@tuxicoman.be> from "Guy Martin"
	at Oct 7, 2006 04:55:19 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The crash occurs because the first argument in the call to
pci_enable_bridges is a null pointer.  It's here:

102253dc <pci_enable_bridges>:
102253dc:       6b c2 3f d9     stw rp,-14(sp)
102253e0:       6f c4 00 80     stw,ma r4,40(sp)
102253e4:       6b c3 3f 89     stw r3,-3c(sp)
102253e8:       4b 5c 00 28     ldw 14(r26),ret0

r26 is zero.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
