<?php
// Bootstrap 4 Vertical Button XSLT theme.

ini_set('display_errors', 'On');
error_reporting(E_ALL);

if(isset($_GET['p'])) $p = $_GET['p'];
  else $p="1";

if(isset($_GET['w'])) $w = $_GET['w'];
  else $w="1";

// Load XML file
$xml = new DOMDocument;
if($w=="2") $xml->load('data/website2.xml');
  else $xml->load('data/website.xml');
$items = $xml->getElementsByTagName('contents');
$contents = trim($items->item(intval($p)-1)->nodeValue);
if($w=="2") $contents = str_replace('"?p=','"?w=2&amp;p=',$contents);
$contents = str_replace("'","&#39;",$contents);
  
// Load XSL file
$xsl = new DOMDocument;
$xsl->load('xslt/theme1bs4.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->setParameter('', 'page', intval($p));
$proc->setParameter('', 'website', intval($w));
$proc->setParameter('', 'contents', $contents);
if($w=="2") $proc->setParameter('','wpm1','w=2&');
if($w=="1") $proc->setParameter('','wpm2','w=2&');

// Attach the xsl rules
$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);
?>