import sys
from PyQt5 import QtCore,QtWidgets

path=sys.argv[1]
app = QtWidgets.QApplication([])
data = QtCore.QMimeData()
url = QtCore.QUrl.fromLocalFile(path)
data.setUrls([url])
app.clipboard().setMimeData(data)
clipboard = QtWidgets.QApplication.clipboard()

