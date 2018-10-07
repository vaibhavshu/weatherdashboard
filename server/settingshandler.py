from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)

from server.db import get_db
from server.util import station_exists

bp = Blueprint('settings', __name__, url_prefix='/settings')

@bp.route('/')
def getstations():
    return render_template('settings/default.html')
