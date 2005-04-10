From: "Bryan W. Headley" <bwheadley@earthlink.net>
Subject: [parisc-linux] Booting Sarge (24-Mar) on c110
Date: Sun, 10 Apr 2005 10:17:08 -0500
Message-ID: <42594374.2040803@earthlink.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Everything works fine, up til the dreaded STI -switchover. So, it boots, 
but video isn't initialized right. Let's see: I'm using tty0, with 
monitor type 3 (1280x1024 Vesa), using graphics3.

Of course, it worked fine with kernel 2.4.x.

Suggestions?


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
