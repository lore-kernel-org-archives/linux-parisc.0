Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA19455
	for <parisc-linux@puffin.external.hp.com>; Wed, 16 Aug 2000 20:10:38 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 16 Aug 2000 20:11:01 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 16 Aug 2000 20:10:34 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id PAA14598
	for parisc-linux@thepuffingroup.com; Wed, 16 Aug 2000 15:06:03 -0400
Date: Wed, 16 Aug 2000 15:06:03 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000816150603.L7757@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] another 64 bit symbol bug
List-ID: <linux-parisc.vger.kernel.org>


linking the 64 bit kernel gives me fault_vector as an undefined symbol
in the objdump -x output.

interestingly, old_end_linux_gateway_page is pointing to the address which
should be pointed to by fault_vector and the references to fault_vector
have been relocated properly.

-- 
Revolutions do not require corporate support.
