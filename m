Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA15885
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 06:31:26 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 15 Jan 2001 13:35:06 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14I9mr-00022b-00
	for parisc-linux@thepuffingroup.com; Mon, 15 Jan 2001 13:35:05 +0000
Date: Mon, 15 Jan 2001 13:35:05 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010115133505.B29423@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] overuse of tables in new website
List-ID: <linux-parisc.vger.kernel.org>


n.b.  i'd be happy to report things like this to an individual if anyone
at linuxcare answered email about the website.

the new website uses lots of unnecessary tables.  let's take the header
image as an example, since it was the first i came across.  the original
code looks like this (reformatted to indicate structure):

<table border=0 cellpadding=0 cellspacing=0 width="100%">
  <tr>
    <td width="10%">
      <table width="100%" cellpadding=0 cellspacing=0 border=0 background="&base;/images/pa-masthead-lines.png">
        <tr>
          <td>
            <img src="&base;/images/pa-masthead-lines.png" width="6" height="63" alt="" border="0">
          </td>
        </tr>
      </table>
    </td>
    <td align="center" width="80%">
      <map name="masthead">
        <area alt="Hewlett Packard Homepage" coords="5,1,84,62" href="http://www.hp.com">
        <area alt="Linuxcare Homepage" coords="565,10,736,54" href="http://www.linuxcare.com">
      </map>
      <img src="&base;/images/pa-masthead-center-a.gif" width="735" height="63" border="0" usemap="#masthead">
    </td>
    <td width="10%">
      <table width="100%" cellpadding=0 cellspacing=0 border=0 background="&base;/images/pa-masthead-lines.png">
        <tr>
          <td>
            <img src="&base;/images/pa-masthead-lines.png" width="6" height="63" alt="" border="0">
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

as far as i an tell using netscape 4.76 on linux, the following looks
identical.

<table cellpadding=0 cellspacing=0 border=0>
  <tr>
    <td>
      <img src="&base;/images/pa-masthead-lines.png" width=6 height=63 alt="" border=0>
    </td><td>
      <map name="masthead">
        <area alt="Hewlett Packard Homepage" coords="5,1,84,62" href="http://www.hp.com">
        <area alt="Linuxcare Homepage" coords="565,10,736,54" href="http://www.linuxcare.com">
      </map>
      <img src="&base;/images/pa-masthead-center-a.gif" width=735 height=63 border=0 usemap="#masthead">
    </td><td>
      <img src="&base;/images/pa-masthead-lines.png" width=6 height=63 alt="" border=0>
    </td>
  </tr>
</table>

there are still things I dislike about this.  for example, it seems
to be using an imagemap unecessarily -- what's wrong with having
<left><hp><centre><linuxcare><right> with ordinary link tags on <hp>
and <linuxcare>?

if the argument is that it'll take longer to download with more images, then
why do we have the separate left and right masthead-lines images?  they complicate
the whole thing, and if they were amalgamated into the image this html could be cut down to:

<map name="masthead">
  <area alt="Hewlett Packard Homepage" coords="11,1,90,62" href="http://www.hp.com">
  <area alt="Linuxcare Homepage" coords="571,10,742,54" href="http://www.linuxcare.com">
</map>
<img src="&base;/images/pa-masthead-center-a.gif" width=747 height=63 border=0 usemap="#masthead">

which would please me by eliminating an awful lot of crap :-)

i have similar complaints about other bits, but i can't be bothered to
look at them closely when i have no idea whether anyone's paying any
attention to what i think.

-- 
Revolutions do not require corporate support.
